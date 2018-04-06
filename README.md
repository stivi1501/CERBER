# CERBER
Projekt ma za zadanie wytworzyć narzędzie do kontroli widoczności urządzeń w sieci ip (projekt nie zakłada wytworzenia GUI)

Środowisko uruchomieniowe:</BR>
- Microsoft Windows 10 (z działającą komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,
- klient baz danych np. HeidiSL.

Środowisko programistyczne:</BR>
- Microsoft Windows 10 (z działającą komendą ping),</BR>
- Java 1.8,</BR>
- Xampp (wykrzystywana jedynie baza MariaDB <klon MySQL>),</BR>
- konektor JAVA-MariaDB(MySQL) np. mysql-connector-java-5.1.45,
- klient baz danych np. HeidiSQL,
- Eclipse.

Działanie aplikacji (skrót)</BR>
Aplikacja powstała ze względu na potrzebę monitorowania poprawnego działania urzadzeń sieciwych. Sterowanie odbywa się poprzez 2 tabele: "cerber_setings","cerber_plan". W tabeli "cerber_setings" w kolumie "cerber_setings.threads" określamy maksymalną ilość wątków widzianych z poziomu systemu ( aplikacja dopuszcza istnienie wielu wirtualnych maszyn JAVA w fizycznym systemie komputerowym ). W kolumnnie "cerber_setings.timeout_res" określamy maksymalny czas oczekiania na wynik po rozpoczęciu wykonywania polecenia ( kolumna "cerber_setings.status" po upływie tego czasu w sekundach od czasu "cerber_setings.time_res" jest zerowana). W tabeli "cerber_plan" użytkownik określa "cerber_plan.ip" badanego urządzenia w kolumnie "ip", typ badania w kolumnie "cerber_plan.type" (wartość "p" jeśli chcemy badać poleceniem PING,"s" sprawdzanie otwartości SOCKET'a w urządzeniu docelowym), szczegóły badania określamy w kolumnie "cerber_plan.nn" (w przypadku badania poleceniem PING określamy ilość pakietów wysłanych typu "ICMP Echo Request", w przypadku badania otawartości SOCKET'ów określamy numer badanego SOCKET'a). W kolumnie "cerber_plan.time_cmd" definiujemy czas aktywacji badania. W kolumnie "cerber_plan.status" należy wpisać "0" ("0" oczekiwanie na uruchomienie,"1" w trakcie badania,"2" badanie zakończone). Wyniki są zwracane w kolumnach "cerber_plan.unreachable", "cerber_plan.lost", "cerber_plan.receive", "cerber_plan.sent", "cerber_plan.aveping", "cerber_plan.maxping", "cerber_plan.minping" w przypadku testowania windowsowym poleceniem "PING" (kolumna "cerber_plan.erro" jest uzupełniana na podstawie parsowania tekstowego wyniku polecenia w JAV'ie). Wynik testowania otwartości SOCKET'a jest uzupełniany w kolumnie "cerber_plan.ok_no" (0 SOCKET zamknięty, 1 SOOCKET otwarty). Aplikacja zakłada cykliczne uruchamianie skryptu "jar_exe.bat".
W tym celu można użyć wbudowanego w system "Harmonogramu zadań" lub pętli "loop.bat" z projektu (sprawdz zawartość pliku pod kontem poprawnści katalogów).
