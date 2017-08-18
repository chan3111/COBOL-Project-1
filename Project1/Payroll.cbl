       PROGRAM-ID. Payroll AS "Payroll".
       AUTHOR. ChandlerNewmanReed.
       DATE-WRITTEN. 01-26-2017.
       DATE-COMPILED. 01-26-2017.
       
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
               FILE-CONTROL.
               SELECT PAYROLL-FILE ASSIGN TO 'outfile.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD PAYROLL-FILE.
           01 PAYRECORD-OUT.
               10 OUT-EMPLOYEE-NUMBER   PIC 9(9).
               10 FILLER                PIC X(1) VALUE SPACE.
               10 OUT-EMPLOYEE-INITIAL  PIC A(1).
               10 FILLER                PIC X(1) VALUE SPACE.
               10 OUT-EMPLOYEE-LASTNAME PIC A(10).

           WORKING-STORAGE SECTION.
           01 PAYRECORD-IN.
               10 EMPLOYEE-NUMBER   PIC 9(9).
               10 FILLER            PIC X(1) VALUE SPACE.
               10 EMPLOYEE-INITIAL  PIC A(1).
               10 FILLER            PIC X(1) VALUE SPACE.
               10 EMPLOYEE-LASTNAME PIC A(15).
           01 END-INPUT PIC A(1).
       
       PROCEDURE DIVISION.
           MAIN-PROCEDURE.
               PERFORM CREATE-PAYROLL-FILE.
               PERFORM CREATE-PAYROLL-RECORD UNTIL END-INPUT = 'N'.
               PERFORM TERMINATE-CREATE-PAYROLL-FILE.
               STOP RUN.
           CREATE-PAYROLL-FILE.
               OPEN OUTPUT PAYROLL-FILE.
           TERMINATE-CREATE-PAYROLL-FILE.
               CLOSE PAYROLL-FILE.
           CREATE-PAYROLL-RECORD.
               PERFORM PAYROLL-PROMPT.
               IF END-INPUT = 'Y' THEN
                   PERFORM CREATE-RECORD
                   PERFORM WRITE-RECORD
               END-IF.
           PAYROLL-PROMPT.
               DISPLAY 'EMPLOYEE RECORD ENTRY? Y or N'.
               ACCEPT END-INPUT.
           CREATE-RECORD.
               DISPLAY 'ENTER AN EMPLOYEE NUMBER:'.
               ACCEPT EMPLOYEE-NUMBER.
               DISPLAY 'ENTER AN EMPLOYEE LASTNAME:'.
               ACCEPT EMPLOYEE-LASTNAME.
               DISPLAY 'ENTER AN EMPLOYEE INITIAL:'.
               ACCEPT EMPLOYEE-INITIAL.
           WRITE-RECORD.
               MOVE PAYRECORD-IN TO PAYRECORD-OUT.
               WRITE PAYRECORD-OUT.
       END PROGRAM Payroll.
