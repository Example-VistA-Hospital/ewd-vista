ewdVistAFileman ; VEN/SMH - Fileman wrapper functions for EWDLite;2016-09-26  2:44 PM
 ;;1.0;VistA Web Utilties;
 ;
 ; wards1("DILIST",0)="14^*^0^"
 ; wards1("DILIST",0,"MAP")="IEN^.01"
 ; wards1("DILIST",1,0)="12^2-INTERMED"
 ; wards1("DILIST",2,0)="5^3 NORTH SURG"
 ; wards1("DILIST",3,0)="33^3E NORTH"
 ;
LIST(DDRFILE,DDRIENS,DDRFLDS,DDRFLAGS,DDRMAX,DDRFROM,DDRPART,DDRXREF,DDRSCRN,DDRID) ; Lister
 I $G(DDRFROM),$L(DDRFROM,"^")>1 N I F I=1:1:$L(DDRFROM,"^") S DDRFROM(I)=$P(DDRFROM,"^",I) ; flatten from
 I $G(DDRFLAGS)'["P" S DDRFLAGS="P"_$G(DDRFLAGS)
 N DIERR
 D LIST^DIC(DDRFILE,$G(DDRIENS),$G(DDRFLDS),$G(DDRFLAGS),$G(DDRMAX),.DDRFROM,$G(DDRPART),$G(DDRXREF),$G(DDRSCRN),$G(DDRID))
 ;
 ; ZEXCEPT: DIERR
 I $G(DIERR) Q "-1^error"
 Q "0^OK"
 ;
TEST w $$LIST(42,"","@;.01","PQ","","","","B","S D0=Y D WIN^DGPMDDCF I 'X","") QUIT
TEST2 w $$LIST(42) QUIT
TEST3 w $$LIST(8994) QUIT
