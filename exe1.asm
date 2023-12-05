.data
    prompt: .asciiz "Digite o valor mensal: "
    result_msg: .asciiz "Ao final do ano "
    newline: .asciiz "\n"
    space: .asciiz ": "
    years: .word 10                    # Número de anos
    capital: .float 0.0                # Montante de capital inicial

.text
    main:
        # Solicitar ao usuário para inserir o valor mensal
        li $v0, 4
        la $a0, prompt
        syscall

        # Ler o valor mensal inserido pelo usuário
        li $v0, 6           # Código da syscall para ler um float
        syscall
        mov.s $f4, $f0      # Mova o valor float para $f4

        lw $t1, years        # Carrega o número de anos
        l.s $f2, capital     # Carrega o montante de capital inicial
        addi $t5, $t5, 1

    calculate_yearly_amount:
        # Loop para cada ano
        li $t2, 12  # Número de meses em um ano
        li $t3, 0   # Inicializa o contador de meses

    calculate_monthly_amount:
        # Loop para cada mês
        # Adiciona a contribuição mensal ao montante de capital
        add.s $f2, $f2, $f4

        # Incrementa o contador de meses
        addi $t3, $t3, 1

        # Verifica se todos os meses do ano foram processados
        bne $t3, $t2, calculate_monthly_amount

        # Reinicia o contador de meses
        li $t3, 0

        # Exibir mensagem de resultado ao final do ano
        li $v0, 4
        la $a0, result_msg
        syscall

        # Exibir o número do ano 
        move $a0, $t5
        li $v0, 1
        syscall

        # Exibir espaçamento
        li $v0, 4
        la $a0, space
        syscall

        # Exibir o montante de capital final ao final do ano
        li $v0, 2
        mov.s $f12, $f2
        syscall

        # Exibir quebra de linha
        li $v0, 4
        la $a0, newline
        syscall

        # Decrementa o número de anos
        subi $t1, $t1, 1
        addi $t5, $t5, 1      

        # Verifica se todos os anos foram processados
        bnez $t1, calculate_yearly_amount

    end_program:
        # Saída do programa
        li $v0, 10
        syscall
