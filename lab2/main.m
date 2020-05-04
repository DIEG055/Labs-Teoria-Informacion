
# Se pide la funcion f(x) al usuario
funcion= input('Ingrese la funci�n: ', "s");
f=inline(funcion,'x');

#Se pide el numero de niveles n
n = input("ingrese el numero n para obtener 2^n niveles: ");
disp(["numero de niveles : ",num2str(n)]);

#Se pide el periodo T 
T=input("ingrese el periodo: ");

q_max=input("ingrese el valor maximo al cual se quiere cuanticizar: ");



#PUNTO A
t = muestreo(t,f,T)

# PUNTO B
xq = quantizacacionUniforme(t,f,q_max,n)

# PUNTO C
y_niveles_binario = codificacion(n,t,f,xq,q_max)

# PUNTO D
disp("Seleccione el numero correspondiente al tipo de codificacion:");
disp("1)    Unipolar NRZ");
disp("2)    Bipolar  NRZ");
disp("3)    Unipolar RZ");
disp("4)    Bipolar  RZ");
disp("5)    AMI");
disp("6)    Manchester");
opcion=input("ingrese su opcion: ");

pulsos(opcion,y_niveles_binario)


# PUNTO E
demodulador(t,f,T,y_niveles_binario)


