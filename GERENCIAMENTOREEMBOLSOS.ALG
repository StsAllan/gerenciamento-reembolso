algoritmo "GerenciamentoReembolsos"
var
    // Estrutura para armazenar os pedidos
    numeroPedido: vetor[1..100] de inteiro
    numeroCompra: vetor[1..100] de inteiro
    descricao: vetor[1..100] de caractere
    decisao: vetor[1..100] de caractere
    justificativa: vetor[1..100] de caractere

    // Variáveis de controle
    inicioFila, fimFila: inteiro
    opcao: inteiro
    i: inteiro

inicio
    // Inicializa a fila
    inicioFila <- 1
    fimFila <- 0

    repita
        // Menu de opções
        escreval("===== MENU =====")
        escreval("1. Adicionar pedido de reembolso")
        escreval("2. Processar pedido de reembolso")
        escreval("3. Checar status dos reembolsos processados")
        escreval("4. Sair")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha opcao
            caso 1
                // Adicionar pedido à fila
                se (fimFila < 100) então
                    fimFila <- fimFila + 1
                    escreva("Número do pedido: ")
                    leia(numeroPedido[fimFila])
                    escreva("Número da compra: ")
                    leia(numeroCompra[fimFila])
                    escreva("Descrição da solicitação: ")
                    leia(descricao[fimFila])
                    escreval("Pedido adicionado à fila com sucesso!")
                senão
                    escreval("Fila cheia! Não é possível adicionar mais pedidos.")
                fimse

            caso 2
                // Processar pedido (remover da fila e analisar)
                se (inicioFila <= fimFila) então
                    escreval("===== DETALHES DO PEDIDO =====")
                    escreval("Número do pedido: ", numeroPedido[inicioFila])
                    escreval("Número da compra: ", numeroCompra[inicioFila])
                    escreval("Descrição: ", descricao[inicioFila])
                    escreval("=============================")

                    escreva("Decisão (aprovado/reprovado): ")
                    leia(decisao[inicioFila])

                    se (decisao[inicioFila] = "reprovado") então
                        escreva("Justificativa: ")
                        leia(justificativa[inicioFila])
                    fimse

                    // Exibe o resultado da análise
                    escreval("===== RESULTADO DA ANÁLISE =====")
                    escreval("Número do pedido: ", numeroPedido[inicioFila])
                    escreval("Número da compra: ", numeroCompra[inicioFila])
                    escreval("Descrição: ", descricao[inicioFila])
                    escreval("Decisão: ", decisao[inicioFila])
                    se (decisao[inicioFila] = "reprovado") então
                        escreval("Justificativa: ", justificativa[inicioFila])
                    fimse

                    // Remove o pedido da fila
                    inicioFila <- inicioFila + 1
                senão
                    escreval("Fila vazia! Nenhum pedido para processar.")
                fimse

            caso 3
                // Checar status dos reembolsos processados
                se (inicioFila > 1) então
                    escreval("===== REEMBOLSOS PROCESSADOS =====")
                    para i de 1 ate inicioFila - 1 faca
                        escreval("Pedido ", i, ":")
                        escreval("  Número do pedido: ", numeroPedido[i])
                        escreval("  Número da compra: ", numeroCompra[i])
                        escreval("  Descrição: ", descricao[i])
                        escreval("  Decisão: ", decisao[i])
                        se (decisao[i] = "reprovado") então
                            escreval("  Justificativa: ", justificativa[i])
                        fimse
                        escreval("-----------------------------")
                    fimpara
                senão
                    escreval("Nenhum reembolso processado ainda.")
                fimse

            caso 4
                escreval("Saindo do sistema...")
            outrocaso
                escreval("Opção inválida! Tente novamente.")
        fimescolha
    até (opcao = 4)
fimalgoritmo