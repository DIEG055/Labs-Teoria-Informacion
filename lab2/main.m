
# Se pide la funcion f(x) al usuario
funcion= input('Ingrese la funcion: ', "s");
f=inline(funcion,'x');

#Se pide el numero de niveles n
n = input("ingrese el numero n para obtener 2^n niveles: ");
disp(["numero de niveles : ",num2str(n)]);

#Se pide el periodo T 
T=input("ingrese el periodo: ");

# magnitud máxima de la señal a ser cuantizada
q_max=input("ingrese el valor maximo al cual se quiere cuantizar: ");




#PUNTO A
t = muestreo(f,T);
pause;
# PUNTO B
xq = quantizacacionUniforme(t,f,q_max,n);
pause;
# PUNTO C
niveles_binarios = codificacion(n,t,f,xq,q_max)
pause;

# PUNTO D
while(true)
disp("Seleccione el numero correspondiente al formato que desee:");
disp("1)    Unipolar NRZ");
disp("2)    Bipolar  NRZ");
disp("3)    Unipolar RZ");
disp("4)    Bipolar  RZ");
disp("5)    AMI      RZ");
disp("6)    Manchester");
disp("7)    Salir");
opcion=input("ingrese su opcion: ");
if opcion ==7 
  break
endif
pulsos(opcion,niveles_binarios)
pause;
endwhile


# PUNTO E
demodulador(t,f,T,niveles_binarios)


