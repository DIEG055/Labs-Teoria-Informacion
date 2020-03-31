
clear
#Constantes
a = 5;
T = 6*pi;

Wc = 1
Wc_1 = 1
Wc_2 = 4

Ts = 0.1;
#Tiempo
t = ( -T : Ts : T );
#Frecuencia
w = t( 1 : 2 : end );

#-------  FUNCIONES -----



#Funcion rectangular
rec = Funcion(t,a);
#Pasar al dominio de la frecuencia para poder aplicar los filtros
f_rec=fftshift( fft(rec) * Ts )( 1 : 2 : end );

#-------  FILTROS  -------
#Se multiplican las funciones termino a termino para aplicar el filtro


#Filtro LPF y pasar al dominio del tiempo con ifft(x)
LPF_fre=f_rec.*LPF(w,Wc);
LPF_tiem=ifftshift(ifft(LPF_fre));

#Filtro HPF
HPF_fre=f_rec.*HPF(w,Wc);
HPF_tiem=ifftshift(ifft(HPF_fre));

#Filtro BPF
BPF_fre=f_rec.*BPF(w,Wc_1,Wc_2);
BPF_tiem=ifftshift(ifft(BPF_fre));

#Filtro BSF
BSF_fre=f_rec.*BSF(w,Wc_1,Wc_2);
BSF_tiem=ifftshift(ifft(BSF_fre));

#---------  GRAFICAS  ---------

#LPF
figure(1);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\t'); ylabel('X(\w)'); title('Funcion original en tiempo'); grid;
subplot(4,1,2); plot( w, abs(LPF_tiem)  ); xlabel('\t'); ylabel('X(\w)'); title('PASA BAJAS en tiempo'); grid;
subplot(4,1,3); plot( w, f_rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, real(LPF_fre)); xlabel('\w'); ylabel('X(\w)'); title('PASA BAJAS en frecuencia'); grid;

#HPF
figure(2);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\t'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(HPF_tiem)); xlabel('\t'); ylabel('X(\w)'); title('PASA ALTAS en tiempo'); grid;
subplot(4,1,3); plot( w, f_rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, real(HPF_fre) ); xlabel('\w'); ylabel('X(\w)'); title('PASA ALTAS en frecuencia'); grid;

#BPF
figure(3);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(BPF_tiem)); xlabel('\w'); ylabel('X(\w)'); title('PASA BANDAS en tiempo'); grid;
subplot(4,1,3); plot( w, f_rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, real(BPF_fre)  ); xlabel('\w'); ylabel('X(\w)'); title('PASA BANDAS en frecuencia'); grid;

#BSF
figure(4);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(BSF_tiem) ); xlabel('\w'); ylabel('X(\w)'); title('SUPRIME BANDAS en tiempo'); grid;
subplot(4,1,3); plot( w, f_rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, real(BSF_fre)  ); xlabel('\w'); ylabel('X(\w)'); title('SUPRIME BANDAS en frecuencia'); grid;





