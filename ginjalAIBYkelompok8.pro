/*====================================================================================
           SISTEM PAKAR TENTANG DIAGNOSA PENYAKIT GINJAL versi 1.0
				KELOMPOK 8
		            KECERDASAN BUATAN 
=====================================================================================*/

domains
            sakit = symbol
            gejala = symbol
            tanya = string
            jawab = char
            list = string*
database
            xcari(gejala)
            xgagal(gejala)
predicates
            mulai
            cari(tanya,gejala)
            gagal(tanya,gejala)
            namakelompok(list)
  nondeterm gejala(gejala)
            hapus_fakta2
            simpan(gejala,jawab)
            tanya(tanya,gejala,jawab)
            go_once
  nondeterm diagnosa(sakit)
            solusi(sakit)
       
goal
        
	write("--------------SELAMAT DATANG DI RUMAH SAKIT UNMUL-------------"),nl,
	write("--------------------DIAGNOSIS PENYAKIT GINJAL--------------"),nl,nl,
	write("---------------------------------------by-----------------------------"),nl,
	namakelompok(["Ade chrisvitandy","Gideon lung Tumanan","Awang jordi Saputra"]),nl,nl,
	write("SILAHKAN ISI DIAGNOSA DIBAWAH DENGAN KONDISI Y (benar) & T (untuk tidak)"),nl,nl,
        mulai.
clauses
            namakelompok([]).
            namakelompok([H|T]):- 
	             write(H),nl,
	                  namakelompok(T).
            mulai:-
                        go_once,nl,nl,nl,nl,nl,
                        write("Apakah Ingin mengulang lagi (Y/T) ?"),
                        readchar(Jawab),nl,
                        Jawab = 'y',
                        mulai.
            go_once:-
                        diagnosa(_),!,write("Save"),
                        save("simpanginjal.txt"),
                        hapus_fakta2.
            go_once:-
                        write("MAAF SAYA TIDAK MENEMUKAN PENYAKIT PADA GINJAL YANG DIPERIKSA"),nl,
                        hapus_fakta2.
            cari(_,Gejala):-write("Apakah "),
                        xcari(Gejala),!.
            cari(Tanya,Gejala):-write(" Anda "),
                        not(xgagal(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
            gagal(_,Gejala):-
                        xgagal(Gejala),!.
            gagal(Tanya,Gejala):-
                        not(xcari(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='t'.
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            simpan(Gejala,'y'):-
                        asserta(xcari(Gejala)).
            simpan(Gejala,'t'):-
                        asserta(xgagal(Gejala)).
            hapus_fakta2:-
                        retract(xcari(_)),fail.
            hapus_fakta2:-
                        retract(xgagal(_)),fail.
            hapus_fakta2.

/*-------------------------------------------------------------G E J A L A-------------------------------------------------------------*/

            gejala(Gejala):-
                        xcari(Gejala),!.
            gejala(Gejala):-
                        xgagal(Gejala),!,fail.

            gejala(akut):-
            		write("======================================"),nl,
            		write("Gagal Ginjal Akut"),nl,
            		write("======================================"),nl,
                        cari(" Nyeri pinggang hebat (y/t)? ",akut),
                        cari(" Kencing sakit (y/t)? ",akut1),
                        cari(" Demam (y/t)? ",akut2),
                        cari(" Kencing merah atau darah (y/t)? ",akut3),
                        cari(" Sering kencing (y/t)? ",akut4),
                        cari(" Kencing sedikit (y/t)? ",akut5).
            gejala(kronis):-
            		write("======================================"),nl,
            		write("Gagal Ginjal Kronis"),nl,
            		write("======================================"),nl,
                        cari(" Hilang nafsu makan (y/t)? ",kronis),
                        cari(" Lelah dan lemah (y/t)? ",kronis1),
                        cari(" Bermasalah dalam tidur (y/t)? ",kronis2),
                        cari(" Otot berkedut dan kejang (y/t)? ",kronis3),
                        cari(" Bengkak pada area kaki (y/t)? ",kronis4),
                        cari(" Timbul rasa Gatal (y/t)? ",kronis5).
             gejala(batu):-
             		write("======================================"),nl,
            		write("Batu Ginjal"),nl,
            		write("======================================"),nl,
                        cari(" Nyeri pada saat buang air kecil (y/t)? ",batu),
                        cari(" Urin berwarna pink, merah atau coklat (y/t)? ",batu1),
                        cari(" Mual dan muntah (y/t)? ",batu2),
                        cari(" sering buang air kecil (y/t)? ",batu3),
                        cari(" Nyeri punggung, pinggul atau pangkal paha (y/t)? ",batu4).    
	     gejala(infeksi):-
	     		write("======================================"),nl,
            		write("Infeksi Ginjal"),nl,
            		write("======================================"),nl,
                        cari(" nyeri pada perut (y/t)? ",infeksi),
                        cari(" nanah atau darah pada urin (y/t)? ",infeksi1).
             gejala(kangker):-
             		write("======================================"),nl,
            		write("Kangker Ginjal"),nl,
            		write("======================================"),nl,
                        cari(" Tubuh terasa sangat lelah sekali tanpa sebab apapun (y/t)? ",kangker),
                        cari(" Rasa nyeri pada sisi yang  tidak hilang (y/t)? ",kangker1),
                        cari(" Adanya darah dalam urin (y/t)? ",kangker2).
                     	
/* -----------------------------------------------------------D I A G N O S A-------------------------------------------------------- */

           
            diagnosa("Gagal ginjal akut"):-
                        gejala(akut),
                        gejala(akut1),
                        gejala(akut2),
                        gejala(akut3),
                        gejala(akut4),
                        gejala(akut5),
                        solusi("Gagal Ginjal Akut").
            diagnosa("Gagal ginjal Kronis"):-
                        gejala(kronis),
                        gejala(kronis1),
                        gejala(kronis2),
                        gejala(kronis3),
                        gejala(kronis4),
                        gejala(kronis5),
                        solusi("Gagal Ginjal Kronis").            
            diagnosa("Batu Ginjal"):-
                        gejala(batu),
                        gejala(batu1),
                        gejala(batu2),
                        gejala(batu3),
                        gejala(batu4),
                        solusi("Batu Ginjal"). 
                         
	    diagnosa("Penyakit Infeksi Ginjal"):-
                        gejala(infeksi),
       			gejala(infeksi1),
                        solusi("Infeksi Ginjal").
            diagnosa("Penyakit Kangker Ginjal"):-
                        gejala(kangker),
                        gejala(kangker1),
                        gejala(kangker2),
                    	solusi("Kangker Ginjal").
/*==================================================================================================================================*/           
            
            solusi(Sakit):-
                        upper_lower(Xsakit,Sakit),nl,nl,nl,
                        write(" Gejala yang ada pada ginjal anda adalah = ",Xsakit),nl.  
                                             