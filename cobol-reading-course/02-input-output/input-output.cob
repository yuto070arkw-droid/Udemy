       IDENTIFICATION DIVISION.
       PROGRAM-ID. INPUT-OUTPUT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NAME          PIC X(20).
       01  WS-MESSAGE       PIC X(40).
       PROCEDURE DIVISION.
           DISPLAY "名前を入力してください: " WITH NO ADVANCING.
           ACCEPT WS-NAME.
           STRING "こんにちは、" DELIMITED BY SIZE
                  WS-NAME       DELIMITED BY SPACE
                  "さん"        DELIMITED BY SIZE
             INTO WS-MESSAGE.
           DISPLAY WS-MESSAGE.
           STOP RUN.
