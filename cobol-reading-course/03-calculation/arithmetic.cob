       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARITHMETIC-SAMPLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-A              PIC 9(3) VALUE 120.
       01  WS-B              PIC 9(3) VALUE  30.
       01  WS-RESULT         PIC 9(5).
       PROCEDURE DIVISION.
           ADD WS-B TO WS-A.
           DISPLAY "ADD 後の WS-A = " WS-A.

           SUBTRACT 10 FROM WS-A.
           DISPLAY "SUBTRACT 後の WS-A = " WS-A.

           MULTIPLY WS-A BY 2 GIVING WS-RESULT.
           DISPLAY "MULTIPLY の結果 = " WS-RESULT.

           DIVIDE WS-RESULT BY WS-B GIVING WS-RESULT.
           DISPLAY "DIVIDE の結果 = " WS-RESULT.
           STOP RUN.
