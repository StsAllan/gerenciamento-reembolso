algoritmo "GerenciamentoReembolsos"
var
    // Estrutura para armazenar os pedidos
    numeroPedido: vetor[1..100] de inteiro
    numeroCompra: vetor[1..100] de inteiro
    descricao: vetor[1..100] de caractere
    decisao: vetor[1..100] de caractere
    justificativa: vetor[1..100] de caractere

    // Vari�veis de controle
    inicioFila, fimFila: inteiro
    opcao: inteiro
    i: inteiro

inicio
    // Inicializa a fila
    inicioFila <- 1
    fimFila <- 0

    repita
        // Menu de op��es
        escreval("===== MENU =====")
        escreval("1. Adicionar pedido de reembolso")
        escreval("2. Processar pedido de reembolso")
        escreval("3. Checar status dos reembolsos processados")
        escreval("4. Sair")
        escreva("Escolha uma op��o: ")
        leia(opcao)

        escolha opcao
            caso 1
                // Adicionar pedido � fila
                se (fimFila < 100) ent�o
                    fimFila <- fimFila + 1
                    escreva("N�mero do pedido: ")
                    leia(numeroPedido[fimFila])
                    escreva("N�mero da compra: ")
                    leia(numeroCompra[fimFila])
                    escreva("Descri��o da solicita��o: ")
                    leia(descricao[fimFila])
                    escreval("Pedido adicionado � fila com sucesso!")
                sen�o
                    escreval("Fila cheia! N�o � poss�vel adicionar mais pedidos.")
                fimse

            caso 2
                // Processar pedido (remover da fila e analisar)
                se (inicioFila <= fimFila) ent�o
                    escreval("===== DETALHES DO PEDIDO =====")
                    escreval("N�mero do pedido: ", numeroPedido[inicioFila])
                    escreval("N�mero da compra: ", numeroCompra[inicioFila])
                    escreval("Descri��o: ", descricao[inicioFila])
                    escreval("=============================")

                    escreva("Decis�o (aprovado/reprovado): ")
                    leia(decisao[inicioFila])

                    se (decisao[inicioFila] = "reprovado") ent�o
                        escreva("Justificativa: ")
                        leia(justificativa[inicioFila])
                    fimse

                    // Exibe o resultado da an�lise
                    escreval("===== RESULTADO DA AN�LISE =====")
                    escreval("N�mero do pedido: ", numeroPedido[inicioFila])
                    escreval("N�mero da compra: ", numeroCompra[inicioFila])
                    escreval("Descri��o: ", descricao[inicioFila])
                    escreval("Decis�o: ", decisao[inicioFila])
                    se (decisao[inicioFila] = "reprovado") ent�o
                        escreval("Justificativa: ", justificativa[inicioFila])
                    fimse

                    // Remove o pedido da fila
                    inicioFila <- inicioFila + 1
                sen�o
                    escreval("Fila vazia! Nenhum pedido para processar.")
                fimse

            caso 3
                // Checar status dos reembolsos processados
                se (inicioFila > 1) ent�o
                    escreval("===== REEMBOLSOS PROCESSADOS =====")
                    para i de 1 ate inicioFila - 1 faca
                        escreval("Pedido ", i, ":")
                        escreval("  N�mero do pedido: ", numeroPedido[i])
                        escreval("  N�mero da compra: ", numeroCompra[i])
                        escreval("  Descri��o: ", descricao[i])
                        escreval("  Decis�o: ", decisao[i])
                        se (decisao[i] = "reprovado") ent�o
                            escreval("  Justificativa: ", justificativa[i])
                        fimse
                        escreval("-----------------------------")
                    fimpara
                sen�o
                    escreval("Nenhum reembolso processado ainda.")
                fimse

            caso 4
                escreval("Saindo do sistema...")
            outrocaso
                escreval("Op��o inv�lida! Tente novamente.")
        fimescolha
    at� (opcao = 4)
fimalgoritmo