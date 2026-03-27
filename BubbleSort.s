.DATA
    ; Definir os números da lista
    NUM1 = $0005
    NUM2 = $0007
    NUM3 = $0009
    ; ----------

.CODE
    ; Inicializar nos registradores e depois na rom
    LOAD R0 NUM1
    STORE R0 @0000
    LOAD R0 NUM2
    STORE R0 @0001
    LOAD R0 NUM3
    STORE R0 @0002
    LOAD R0 @0000 ; Ponteiro para Array
    LOAD R1 $0003 ; Comprimento Fixo da Lista
    ; ------------
    ; Implementar Bubble Sort

POST_ISR:
    ; Por algum motivo, caso não tenha um loop final executando, resultará em erro.
    LOAD R3 $0100
    JMP POST_ISR