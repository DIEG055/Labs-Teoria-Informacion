function pulsos(opcion,y_niveles_binario)
  y=[];

#Tipos dependiendo de la eleccion
f_s=length(y_niveles_binario);

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
  len= t1(end);
  figure(3);
    subplot(2,1,1);
  plot(t1,y,'k');
  axis([0 50 -1.5 1.5]);
  title('Primera parte de la Señal codificada');
  xlabel('nT_s'); 
  ylabel('x(nT_s)');
  subplot(2,1,2);
  plot(t1,y,'k');
  axis([0 len -1.5 1.5]);
  title('Señal codificada total');
  xlabel('nT_s');
  ylabel('x(nT_s)');


endfunction
