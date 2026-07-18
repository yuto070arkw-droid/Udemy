       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATE-SAMPLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-RANK           PIC X VALUE "B".
       01  WS-DISCOUNT-RATE  PIC 99 VALUE 0.
       PROCEDURE DIVISION.
           EVALUATE WS-RANK
              WHEN "A"
                 MOVE 20 TO WS-DISCOUNT-RATE
              WHEN "B"
                 MOVE 10 TO WS-DISCOUNT-RATE
              WHEN "C"
                 MOVE 5 TO WS-DISCOUNT-RATE
              WHEN OTHER
                 MOVE 0 TO WS-DISCOUNT-RATE
           END-EVALUATE.

           DISPLAY "会員ランク = " WS-RANK.
           DISPLAY "割引率 = " WS-DISCOUNT-RATE "%".
           STOP RUN.
