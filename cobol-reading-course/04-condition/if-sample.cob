       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-SAMPLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-SCORE          PIC 9(3) VALUE 82.
       01  WS-JUDGE          PIC X(10).
       PROCEDURE DIVISION.
           IF WS-SCORE >= 80
              MOVE "PASS" TO WS-JUDGE
           ELSE
              MOVE "RETRY" TO WS-JUDGE
           END-IF.

           DISPLAY "点数 = " WS-SCORE.
           DISPLAY "判定 = " WS-JUDGE.
           STOP RUN.
