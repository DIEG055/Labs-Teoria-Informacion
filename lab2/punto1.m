% Script que hace la fft al pulso rectangular y aplica filtros 

%--
IN= input('Ingrese la funci�n: ', "s");
F=inline(IN,'x');

#Lectura de n
n = input("ingrese el numero n para obtener 2^n niveles: ");
disp(["numero de niveles : ",num2str(n)]);

T_m=input("ingrese el periodo: ");

f_m=1/T_m; #Frecuencia 
f_s=2*f_m; #Frecuencia de muestreo

# Arreglo para el muestreo
t=[0:f_s:2*T_m];

# Arreglo funci�n original
t_s=[0:0.02:2*T_m];

#Cuantizacion uniforme
x=F(t);
xmax=input("ingrese el valor maximo al cual se quiere cuanticizar: ");
xq=cuantUniforme(x,xmax,n);

#-----Literal a. MUESTREO-----------

figure(1);
subplot(3,1,1),plot(t_s,F(t_s),'k'); title('F(t) original'); grid;
subplot(3,1,2),stem(t,F(t),'k'); title('F(t) muestreada'); grid;


%------Literal b. CUANTIZACION-------

subplot(3,1,3);stem(t,xq,'k'); title('F(t) cuantizada');xlabel('nT_s'); ylabel('x(nT_s)');



%------Literal c. CODIFICACION--------

pulsos_binarios = log2(n); #log_2 (n) pulsos binarios por cada muestreo de la senal
num_total_pulsos = length(F(t))*pulsos_binarios; #Cantidad total de pulsos binarios necesarios para transmitir la senal
x_pulsos = [0:num_total_pulsos-1]; #Arreglo de cantidad total de pulsos
y_niveles= get_nivel(xq,n,xmax);   
y_niveles_binario = convertir_10(y_niveles,pulsos_binarios); #arreglo de binarios final

%-------Literal d. REPRESENTACION DEL PULSO-------------------------------
disp("Seleccione el tipo de codificaci�n :");
disp("1-Unipolar NRZ");
disp("2-Bipolar NRZ");
disp("3-Unipolar RZ");
disp("4-Bipolar RZ");
disp("5-AMI");
disp("6-Manchester");
opcion=input("ingrese la opci�n: ");
y=[];

#Tipos dependiendo de la eleccion
f_s=100;
#No Return to Zero
NRZ=ones(1,f_s);
#Return Zero
RZ= [ones(1,f_s/2) zeros(1,f_s/2)];
#Caso especial para Manchester
Man=[ones(1,f_s/2)  -ones(1,f_s/2)] ;

switch (opcion)
	case 1
		#unipolar NRZ
		tipo=NRZ; #arreglo de unos 
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
		            y=[y  tipo]; 
		        case 0
		            y=[y  (0*tipo)];       

		    end
		end
  #bipolar NRZ
	case 2
		disp("caso 2");
		tipo=NRZ; #arreglo de unos
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
		            y=[y  tipo];
		        case 0
		            y=[y  -tipo];
		    end
		end
	case 3
		#unipolar RZ
		tipo=RZ; #arreglo de 1->0 en fs 
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
		            y=[y  tipo];
		        case 0
		            y=[y  (0*tipo)];        
		    end
		end
	case 4
		#Bipolar RZ
		tipo=RZ;
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
		            y=[y  tipo];
		        case 0
		             y=[y  -tipo];
		    end
		end
	case 5
		#AMI
		tipo=RZ;#arreglo de 1->0 en fs
		count = 0;
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
                if rem(count,2) == 0 # si es par
                  y=[y  tipo];
                else
                  y=[y  -tipo];		 #si es impar         	
                endif
                count++;
		        case 0
		            y=[y  (0*tipo)];        
		    end
		end		
	case 6
		#Manchester
		tipo=Man;#arreglo de 1->-1 en fs
		for i=1:length(y_niveles_binario)
		    switch y_niveles_binario(i)
		        case 1
		            y=[y  tipo];
		        case 0
		             y=[y  -tipo];
		    end
		end
endswitch

t1=(0:(length(y)-1))/f_s;
figure(2);
subplot(1,1,1);plot(t1,y,'k');axis([0 100 -1.1 1.1]); title('Se�al codificada');xlabel('nT_s'); ylabel('x(nT_s)');
%-------Literal e. RECUPERAR M(T)---------

sum=0;
w_m=2*pi*f_m;
for i=0:2*T_m
  fun=F(i*f_s)*(sin(w_m.*(t-i*f_s))/w_m.*(t-i*f_s));
  sum=sum+fun;
endfor

figure(3);
plot(t,sum); title('Recuperacion de la se�al');

