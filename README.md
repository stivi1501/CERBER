# PROJEKT CERBER 
</BR><B>1.CEL WYTWORZENIA APLIKACJI</B></BR></BR>
<p align="justify">Wytworzona w ramach projekt aplikacja ma za zadanie sprawdzać poprawność działania urządzeń w sieci pod względem odpowiedzi na PING' i otwartości odpowiednich SOCKET'ów. Uzyskana w wyniku działania aplikacji wiedza powinna posłużyc do diagnozy stanu urządzeń w sieci i identyfikacji ewentualnych uszkodzeń. Projekt nie zakłada wytworzenia GUI dla tej aplikacji. Sterowanie ma się odbywać poprzez wpisy bezpośrednio na bazie danych.</p></BR>

</BR><B>2.ŚRODOWISKO PROJEKTOWE I ŚRODOWISKO URUCHOMIENIOWE</B></BR></BR>
Środowisko uruchomieniowe:</BR>
- Microsoft Windows 10 (z odblokowaną komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45 (<B><font color="silver">pamiętaj o odpowiednim ustawieniu "Referenced Libraries "</font></B>),</BR>
- klient baz danych np. HeidiSL.</BR>
Środowisko projektowe:</BR>
- Microsoft Windows 10 (z odblokowaną komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,</BR>
- klient baz danych np. HeidiSQL,</BR>
- Eclipse z pluginem Objectaid.</BR>
</BR>

<B>3.BAZA DANYCH</B></BR>
<p align="justify">Baza danych aplkacjii "CERBER" składa się z 3 tabel i 3 procedur bazodanowych.</p>
</BR><B>Tabela cerber_plan</B></BR>
<p align="justify">Główną tabelą bazy danych jest tabela <B>"cerber_plan"</B>. To do tej tabeli są zapisywane zlecane dla aplikacji i do tej tabeli aplikacja zapisuje wyniki. W tabeli <B>"cerber_plan"</B> użytkownik określa "ip" badanego urządzenia w kolumnie <B>"cerber_plan.ip"</B>, typ badania w kolumnie <B>"cerber_plan.type"</B> (wpisujemy wartość "p" jeśli chcemy badać poleceniem PING lub "s" jeśi chcemy sprawdzać otwartości SOCKET'a w urządzeniu docelowym), szczegóły badania określamy w kolumnie <B>"cerber_plan.nn"</B> (w przypadku badania poleceniem PING określamy ilość pakietów wysłanych typu "ICMP Echo Request", w przypadku badania otawartości SOCKET'ów określamy numer badanego SOCKET'a). W kolumnie <B>"cerber_plan.status"</B> należy wpisać "0" ("0" oczekiwanie na uruchomienie,"1" w trakcie badania,"2" badanie zakończone) gdyż kolumna określa status zlecenia. W kolumnie <B>"cerber_plan.time_cmd"</B> definiujemy czas aktywacji badania. W kolumnie <B>"cerber_plan.time_res"</B> wpisujemy czas kolejnego etapu badania (dla <B>"cerber_plan.status"</B> równej 1 jest to czas rozpoczęcia badania, dla <B>"cerber_plan.status"</B> równej 2 jest to czas otrzymmania wyników). Wyniki są zwracane w kolumnach <B>"cerber_plan.unreachable"</B>, <B>"cerber_plan.lost"</B>, <B>"cerber_plan.receive"</B>, <B>"cerber_plan.sent"</B>, <B>"cerber_plan.aveping"</B>, <B>"cerber_plan.maxping"</B>, <B>"cerber_plan.minping"</B> w przypadku testowania windowsowym poleceniem "PING" (kolumna <B>"cerber_plan.erro"</B> jest uzupełniana na podstawie ewentualnego błędu zgłoszonego w JAV'ie). Wynik testowania otwartości SOCKET'a jest uzupełniany w kolumnie <B>"cerber_plan.ok_no"</B> (0 SOCKET zamknięty, 1 SOOCKET otwarty).</BR></p>
<img src="https://github.com/stivi1501/CERBER/blob/master/ping.PNG"  width="900">

</BR><B>Tabela cerber_settings</B></BR>
<p align="justify">W tabeli <B>"cerber_settings"</B> w kolumie <B>"cerber_setings.threads"</B> określamy maksymalną ilość wątków we wszystkich wirtualnych maszynach JAVA łącznie. W kolumnnie <B>"cerber_settings.timeout_res"</B> określamy maksymalny czas oczekiania na wynik określony w <B>"cerber_plan.time_res"</B> (przy <B>"cerber_plan.status"</B> równym 1).</p>

</BR><B>Tabela cerber_plan_temp</B></BR>
<p align="justify">Tabela <B>"cerber_plan_temp"</B> jest tworzona przez procedurę bazodanową <B>cerber_plan_proc</B> i zawiera przepisane wartości z kolumn:<B>"cerber_plan.ip"</B>,<B>"cerber_plan.nn"</B>,<B>"cerber_plan.status"</B>, <B>"cerber_plan.type"</B>, <B>"cerber_plan.time_cmd"</B> oraz kolumne z autoinkrementacją <B>"cerber_plan.id"</B> i identyfikatorem wirtualnej maszyny <B>"cerber_plan.lp"</B></p>


</BR><B>Tabela cerber_plan_lp</B></BR>
<p align="justify">Tabela <B>"cerber_plan_lp"</B> jest tabelą pomocniczą, uaktualnianą przez <B>cerber_plan_proc</B>. Tabela zawiera idenryfikator aktualnie uruchomianej maszyny JAVA w <B>"cerber_plan_lp.lp"</B> oraz minimalną wartość kolumny <B>"cerber_plan_temp.id"</B> w <B>"cerber_plan_lp.min_lp"</B> dla aktualnej maszyny /jAVA</p>

</BR><B>Procedura bazodanowa cerber_plan_proc</B></BR>
<p align="justify">Jest to główna procedura aplikacji, decydująca o rozpoczęciu wątków (badania plecenie PING lub sprawdzanie czy jest otwarty SOCKET) i kontroluje ilość uruchomionych wątków dla wszystkich wirtualnych maszyn JAVA (aplikacja nie może przekraczać iloścci zawartej w "cerber_setings.threads"). W ciele proedury zadeklarowane i używane są 4 zmiene: <B>threads_limit</B> (maksymalna ilość wątków),<B>threads_active</B> (ilość wątków atywnych),<B>id_min_v</B> (minimalna wartość "cerber_plan_temp.id" dla ostatniego wątku określonego w <B>"cerber_plan_lp.lp"</B>),<B>timeout_ress</B> (maksymalny czas oczekiwania na wynik po uruchomieniu komendy-badania)
</BR>
Działanie:</BR>
KROK 1-4:Deklaracja zmiennych w proedurze :threads_limit, threads_active,id_min_v,</BR>
KROK 5:Przypisane zmiennej <B>timeout_ress</B> wartości z kolumny "cerber_settings.timeout_res",</BR>
KROK 6:Restart komend-badań w któych okres oczekiwannia na wynik przekroczył wartość <B>timeout_ress</B> (zerowanie "cerber_plan.status"),</BR>
KROK 7:Inkrementacja "cerber_plan_lp.lp" (identyfikator wirtualnej maszyny JAVA),</BR>
KROK 8-9:Zerowanie kolumn "cerber_plan.dop","cerber_plan.dos" jeśli są ujemne,</BR>
KROK 10:DROP tabeli "cerber_plan_temp",</BR>
KROK 11:Utworzenie tabeli "cerber_plan_temp" z kolumną "cerber_plan_temp.id" autoinkrementującą się,</BR>
KROK 12:Przypisanie zmiennej <B>"cerber_plan_temp"</B> wartości równej policzonej ilości wierszy z kolumną "cerber_plan.status" równą 1 (wątki aktywne),</BR>
KROK 13:Przypisanie zmiennej <B>"threads_limit"</B> wartości z kolumny "cerber_settings.threads" minus wartość zmiennej <B>timeout_ress</B> (z KROK'u 5),</BR>
KROK 14:Przypisanie zmiennej <B>"threads_limit"</B> wartości 0 jeśli wartość zmiennej jest ujemna,</BR>
KROK 15:Wstawienie do tabeli <B>"cerber_plan_temp"</B>  SELECT'a z tabeli "cerber_plan" z "limit threads_limit" (dozwolona ilość wątków inus akywne),</BR>
KROK 16:Aktualizaja kolumny "cerber_plan.status" do wartości 1 na podstawie istniejących odpowiednich wpisów w tabeli "cerber_plan_temp" (warunek współistnienia takich samych wpisów w kolumnach ip, time_cmd,nn oraz "cerber_plan.status" nie równy 2),</BR>
KROK 17:Przypisane zmiennej <B>id_min_v</B> najmiejszej  wartości z kolumny "cerber_plan_temp.id" minus 1 dla kolumny "cerber_plan_temp.lp" jak w kolumnie "cerber_plan_lp.lp" ,</BR>
KROK 18:Aktualizacja  kolumny "cerber_plan_lp.lp" do warośc zmiennej <B>id_min_v</B> (KROK 17),</BR>
KROK 19:Aktualizacja  kolumny "cerber_settings.dop" do wartości równej policzonej ilości wierszy z kolumną "cerber_plan_temp.type" równą "p",</BR>
KROK 20:Aktualizacja  kolumny "cerber_settings.dos" do wartości równej policzonej ilości wierszy z kolumną "cerber_plan_temp.type" równą "s",</BR>
</BR>

<B>Procedura bazodanowa save_res_ping</B></BR>
Procedura ma za zadanie zapisywać wyniki(aktualizować kolumny) klasy "CerberPing",</BR>
</BR><B>Procedura bazodanowa save_res_sock</B></BR>
Procedura ma za zadanie zapisywać wyniki(aktualizować kolumny)  klasy "CerberSock",</BR>
</BR>
Skrypt budujący bazę daych umieszczony jest pod adrresem <B><a href="https://github.com/stivi1501/CERBER/blob/master/skrypt_bazy_danych.sql">https://github.com/stivi1501/CERBER/blob/master/skrypt_bazy_danych.sql</a>. </B>Został on utwrzony rzy pomocy apliacji HeidiSQL.
</p>

<B>4.JAVA - KLASY,OBIEKTY</B></BR>
<img src="https://github.com/stivi1501/CERBER/blob/master/objectaid.PNG"  width="900">
</BR><B>Klasa Cerber</B></BR>
<p align="justify">Jest to główa klasa aplikacji psiadająca metodę main(). Metoda main uruchamia przy pomocy klasy <B>"JdbcConnect"</B> procedurę bazodanową "cerber_plan_proc" oraz wykonuje polecenia zlecone w tabeli "cerber_plan_temp" (uruchamia w wątkach klasy <B>"CerberPing"</B> lub <B>"CerberSock"</B>)</p>

</BR><B>Klasa PingCMD</B></BR>
<p align="justify">Jest to klasa obrabiająca windowsowe plecenie PING</p>

</BR><B>Klasa SocketCheck</B></BR>
<p align="justify">Jest to klasa sprawdzająca otwarcie SOCKET'a</p>

</BR><B>Klasa CerberPing</B></BR>
<p align="justify">Jest to specjalizacja klasy PingCMD implemetuje interfejs Runnable</p>

</BR><B>Klasa CerberSock</B></BR>
<p align="justify">Jest to specjalizacja klasy SocketCheck  implemetuje interfejs Runnable</p>

</BR><B>Klasa JdbcConnect</B></BR>
<p align="justify">Jest to klasa  pośredniicząca w wymianie danych z bazą dnych</p>

</BR><B>Klasa PP</B></BR>
<p align="justify">Jest to klasa  kontener danych</p>

</BR><B>Klasa PingRes</B></BR>
<p align="justify">Jest to klasa  kontener danych</p>


</BR><B>Klasa SockRes</B></BR>
<p align="justify">Jest to klasa  kontener danych</p>
</BR>

<B>5.Opis działania</B></BR>
<p align="justify">
Po uruchomieniu metody "main()" klasy "Cerber" zostaje uruchomiona metoda "jdbc_plan_cerber_proc()" klasy "JdbcConnect" (która uruchamia procedurę bazodanową "cerber_plan_proc()"). Następnie uruchamiane jest pobieranie nastaw z metod jdbc_count_dop() (przepsane do zmiennej "maksp") i jdbc_count_dos() (przepsane do zmiennej "makss") klasy JdbcConnect (dane poierane z odpowiednich kolumn tabeli "cerber_settings"). 
W kolejnym kroku zmienne maksp i makss są sumowane do zmiennej maks (równej ilości wierszy w tabeli "cerber_plan_temp") i jest tworzona pętla z ilością powtórzeń "maks". W każdej iteracji "i" pętli (gdzie "i" jest z zakresu od 0 do "maks") pobierany jest przy pomocy metody jdbc_PPOnId(i+1) wiersz (zadanie do wykonania) z tabeli "cerber_plan_temp". Następnie na podstawie atrybutu "type" tworzony jest obiekt klasy "CerberPing" lub "CerberSock". Obiekty "CerberPing" oraz "CerberSock" uaktualniają kolumne "status" na wartość 1  i zapisują efekty swojej działalności odpowiednio przez metody "add_PingRes","JdbcConect_pingresult" (po zwróceniu ostatniego wyniku) i "add_SockRes","JdbcConect_sockresult" (po zwróceniu ostatniego wyniku) klasy "JdbcConnect" w taeli "cerber_plan" (a właciwie uaktualniają ją).
</p>

<B>6.Opis uruchomienia</B></BR>
<p align="justify">
Wynikowy plik "ExePingCMD.jar" (a właśiwie instrukcje "java -jar D:\Users\stefa\eclipse-workspace\CERBER\src\CERBER\ExePingCMD.jar") powinno wykonywać się cyklicznie przy pomocy systemowego "Harmonogram zadań" lub pętli "loop.bat"
</p>

<B>7.Test głównej funkcjonalności - PING'owania i sprawdzania SOCKET'a</B></BR>
<p align="justify">
  Link do filmu na  <a href="https://www.youtube.com/embed/HrAPd-JNU1s">YOUTUBE</a>
  </BR></BR>
 Zadanie: </BR>
 Aplikacja ma przepingować adresy od 192.168.1.1 do 192.168.1.45 i sprawdzić dla tych adresów otwartość SOCKET'ów 21,22,23.</BR></BR>
 Harmonogram:</BR>
 0:00-0:06 podgląd ilości wątków dla wszystkich maszyn wirtualnych JAVA (150)</BR>
 0.06-0.10 uruchomienie i natychmiatowe zamknięcie wirualnej maszyny JAVA numer 1 z powodu braku zadań (pusta tabela "cerber_plan")</BR>
 0.10-0.15 pokazanie pustej tabeli "cerber_plan" (0 wierszy)</BR>
 0.15-0.21 uruchomienie procedury bazodanowej "cerber_gen_proc2" (wypełnienie tabeli "cerber_plan") </BR>
 0.21-0.31 pokazane wypełnionej tabeli "cerber_plan" (180 wierszy,zadania są zlecone,kolumny wyników są puste)</BR>
 0.31-0.37 utworzenie 150 wątków w wirtualnnej maszynie JAVA numer 1 ( 45 dla PING'ów i 105 dla SOCKET'ów zgodnie z ograniczeniem)</BR>
 1.00-1.08 utworzenie 30 wątków w wirtualnnej maszynie JAVA numer 2 ( pozostałe zadania ze 180)</BR>
 0.37-1.11 wątki wirtualnej maszyny JAVA numer 1 zwracają wyniki do bazy dannych</BR>
 1.08-1.32 wątki wirtualnej maszyny JAVA numer 2 zwracają wyniki do bazy dannych</BR>
 1.43-2.21 Pokazanie wyników  bazie danych (2.01 - 192.168.1.1 i 192.168.1.5 pingują, 2.10 192.168.1.2 pinguje <kolumna recceive wynosi 4>, 2.21 192.168.1.5 ma otwarty SOCKET 23)</BR>
 2.21-2.32 widok na konsole routera.
</BR></BR>
Wnioski :</BR>
Aplikacja poprawne spingowała fragment sieci. Wykryła "aktywne" urządzenia (192.168.1.1,192.168.1.5 192.168.1.2 i 192.168.1.5) i otwarty SOCKET (23 na 192.168.1.5).

  
</p>


