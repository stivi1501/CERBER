# PROEKT CERBER 
Wytworzona w ramach projekt aplikacja ma za zadanie sprawdzać widoczność urządzeń w sieci(projekt nie zakłada wytworzenia GUI)

Środowisko uruchomieniowe:</BR>
- Microsoft Windows 10 (z odblokowaną komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,</BR>
- klient baz danych np. HeidiSL.</BR>

Środowisko programistyczne:</BR>
- Microsoft Windows 10 (z odblokowaną komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,</BR>
- klient baz danych np. HeidiSQL,</BR>
- Eclipse.</BR>

<B>1.BAZA DANYCH</B></BR>
Baza danych aplkacjii "CERBER" składa się z 4 tabel (plus 3 tabele generatora zapytań) i 4 procedur bazodanowych (plus 2 procedury generatora zapytań).
</BR></BR><B>Tabela cerber_plan</B></BR>
Główną tabelą bazy danych jest tabela <B>"cerber_plan"</B>. To do tej tabeli są zlecane zapytania od użytkownika i do tej tabeli aplikacja zapisuje wyniki. W tabeli <B>"cerber_plan"</B> użytkownik określa "ip" badanego urządzenia w kolumnie <B>"cerber_plan.ip"</B>, typ badania w kolumnie <B>"cerber_plan.type"</B> (wartość "p" jeśli chcemy badać poleceniem PING,"s" sprawdzanie otwartości SOCKET'a w urządzeniu docelowym), szczegóły badania określamy w kolumnie <B>"cerber_plan.nn"</B> (w przypadku badania poleceniem PING określamy ilość pakietów wysłanych typu "ICMP Echo Request", w przypadku badania otawartości SOCKET'ów określamy numer badanego SOCKET'a). W kolumnie <B>"cerber_plan.time_cmd"</B> definiujemy najmłodszy czas aktywacji badania. W kolumnie <B>"cerber_plan.status"</B> należy wpisać "0" ("0" oczekiwanie na uruchomienie,"1" w trakcie badania,"2" badanie zakończone). Wyniki są zwracane w kolumnach <B>"cerber_plan.unreachable"</B>, <B>"cerber_plan.lost"</B>, <B>"cerber_plan.receive"</B>, <B>"cerber_plan.sent"</B>, <B>"cerber_plan.aveping"</B>, <B>"cerber_plan.maxping"</B>, <B>"cerber_plan.minping"</B> w przypadku testowania windowsowym poleceniem "PING" (kolumna <B>"cerber_plan.erro"</B> jest uzupełniana na podstawie eentualnego błędu w JAV'ie). Wynik testowania otwartości SOCKET'a jest uzupełniany w kolumnie <B>"cerber_plan.ok_no"</B> (0 SOCKET zamknięty, 1 SOOCKET otwarty).</BR>
<img src="https://github.com/stivi1501/CERBER/blob/master/ping.PNG" alt="ping" height="300">

</BR></BR><B>Tabela cerber_settings</B></BR>
W tabeli "cerber_setings" w kolumie "cerber_setings.threads" określamy maksymalną ilość wątków we wszystkich wirtualnych maszynach JAVA łącznie. W kolumnnie "cerber_setings.timeout_res" określamy maksymalny czas oczekiania na wynik po rozpoczęciu wykonywania polecenia ( kolumna "cerber_setings.status" po upływie tego czasu w sekundach od czasu "cerber_setings.time_res" jest zerowana).
