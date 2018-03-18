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

Działanie aplikacji</BR>
Aplikacja powinna działać cyklicznie poprzez cykliczne uruchamianie pliku ExePingCMD.jar.
W tym celu można użyć wbudowanego w system "Harmonogramu zadań" lub pętli "loop.bat" z projektu (sprawdz zawartość plików pod kontem poprawnści katalogów).Aplikacja czuwa, aby nie przeekroczyć maksymalnej licby wątków (ich maksymalna ilość jest zdefiniowana w tabeli "cerber_setings" i kolumie "threads"). Interakcja z użytkownikiem odbywa się poprzez tabele "cerber_plan", w której użytkownik określa ip badanego urządzenia w kolumnie "ip", typ badania w kolumnie "type" (wartość "p" jeśli chcemy badać poleceniem PING,"s" sprawdzanie otwartości SOKET'a w urządzeniu docelowym), szczegóły badania określamy w kolumnie "nn" (w przypadku badania poleceniem PING określamy ilość pakietów wysłanych "ICMP Echo Request", w przypadku badania otawartości SOCKET'ów określamy numer badanego SOCKET'a). W kolumnie "time_cmd" definiujemy czas aktywacji badania. W kolumnie "status" należy wpisać "0" ("0" oczekiwanie na uruchomienie,"1" w trakcie badania,"2" badanie zakończone). Wyniki działania aplikacji można oglądać ww tabelach "ping_results" i "socket_results".
