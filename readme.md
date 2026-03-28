# Descrição

Tradução de um código AssemblyMIPS32 que implementa BubbleSort para código AssemblyExcel16.

# Execução

Primeiro, é necessário a presença da biblioteca `openpyxl` para manipulação de arquivos `.xlsx`.
Sendo assim, instale com:

```python3
pip install openpyxl
```

Para correta compilação, execute:

```python3
python3 compileExcelASM16.py BubbleSortExcel16.s ROM.xlsx
```

Coloque o arquivo `*.s` que desejar executar na CPUExcel16 e assim o compilador transformará 
as instruções para inseri-las em ROM.xlsx.

Mais instruções de execução na CPUExcel16 estão presentes no PDF do trabalho.

# Outros

- [Vídeo referente à execução do programa `BubbleSortExcel16.s`](ExecutionVideo.mp4)

- [Pdf referente ao trabalho de desenvolvimento e de compreensão](Trabalho_de_Arquitetura_de_Computadores_I.pdf)


