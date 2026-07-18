       IDENTIFICATION DIVISION.
       PROGRAM-ID. COPY-MAIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY "customer-data.cpy".
       PROCEDURE DIVISION.
           MOVE 10001 TO CUSTOMER-ID.
           MOVE "SATO" TO CUSTOMER-NAME.
           MOVE "A" TO CUSTOMER-RANK.

           DISPLAY "顧客ID = " CUSTOMER-ID.
           DISPLAY "顧客名 = " CUSTOMER-NAME.
           DISPLAY "ランク = " CUSTOMER-RANK.
           STOP RUN.
