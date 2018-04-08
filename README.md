# CERBER
Projekt ma za zadanie wytworzyć narzędzie do kontroli widoczności urządzeń w sieci ip (projekt nie zakłada wytworzenia GUI)

Środowisko uruchomieniowe:</BR>
- Microsoft Windows 10 (z działającą komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,</BR>
- klient baz danych np. HeidiSL.</BR>

Środowisko programistyczne:</BR>
- Microsoft Windows 10 (z działającą komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,</BR>
- klient baz danych np. HeidiSQL,
- Eclipse.

1.BAZA DANYCH</BR>
Baza danych aplkacjii "CERBER" składa się z 4 tabel (plus 3 tabele generatora zapytań) i 4 procedur bazodanowych (plus 2 procedury generatora zapytań). Główną tabelą bazy danych jest tabela <B>"cerber_plan"</B>. To do tej tabeli są zlecane zapytania i do tej tabeli są zapisywane wyniki. W tabeli "cerber_plan" użytkownik określa "ip" badanego urządzenia w kolumnie <B>"cerber_plan.ip"</B>, typ badania w kolumnie <B>"cerber_plan.type"</B> (wartość "p" jeśli chcemy badać poleceniem PING,"s" sprawdzanie otwartości SOCKET'a w urządzeniu docelowym), szczegóły badania określamy w kolumnie <B>"cerber_plan.nn"</B> (w przypadku badania poleceniem PING określamy ilość pakietów wysłanych typu "ICMP Echo Request", w przypadku badania otawartości SOCKET'ów określamy numer badanego SOCKET'a). W kolumnie <B>"cerber_plan.time_cmd"</B> definiujemy czas aktywacji badania. W kolumnie <B>"cerber_plan.status"</B> należy wpisać "0" ("0" oczekiwanie na uruchomienie,"1" w trakcie badania,"2" badanie zakończone). Wyniki są zwracane w kolumnach <B>"cerber_plan.unreachable"</B>, <B>"cerber_plan.lost"</B>, <B>"cerber_plan.receive"</B>, <B>"cerber_plan.sent"</B>, <B>"cerber_plan.aveping"</B>, <B>"cerber_plan.maxping"</B>, <B>"cerber_plan.minping"</B> w przypadku testowania windowsowym poleceniem "PING" (kolumna <B>"cerber_plan.erro"</B> jest uzupełniana na podstawie eentualnego błędu w JAV'ie). Wynik testowania otwartości SOCKET'a jest uzupełniany w kolumnie <B>"cerber_plan.ok_no"</B> (0 SOCKET zamknięty, 1 SOOCKET otwarty).


Aplikacja powstała ze względu na potrzebę monitorowania poprawnego działania urzadzeń sieciwych. Sterowanie odbywa się poprzez 2 tabele: "cerber_setings","cerber_plan". W tabeli "cerber_setings" w kolumie "cerber_setings.threads" określamy maksymalną ilość wątków widzianych z poziomu systemu ( aplikacja dopuszcza istnienie wielu wirtualnych maszyn JAVA w fizycznym systemie komputerowym ). W kolumnnie "cerber_setings.timeout_res" określamy maksymalny czas oczekiania na wynik po rozpoczęciu wykonywania polecenia ( kolumna "cerber_setings.status" po upływie tego czasu w sekundach od czasu "cerber_setings.time_res" jest zerowana).  Aplikacja zakłada cykliczne uruchamianie skryptu "jar_exe.bat".
W tym celu można użyć wbudowanego w system "Harmonogramu zadań" lub pętli "loop.bat" z projektu (sprawdz zawartość pliku pod kontem poprawnści katalogów).
<img src="https://www.w3schools.com/tags/smiley.gif" alt="Smiley face" width="42" height="42">
