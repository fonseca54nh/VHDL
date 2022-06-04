# Tutorial para rodar a simulação

Diante da dificuldade que tive para rodar a simulação pela primeira vez, acho válido criar este tutorial para evitar retrabalho :D. Para rodar esta simulação siga os passos abaixo:

* Crie um diretório para armazenar seus arquivos de simulação (Pode ser um procedimento simples via interface Windowns mesmo);
* Cole os arquivos PROCESSO_END e TB_PROCESSO_END para a pasta que você acabou de criar.
* No console do modelsim navegue até a pasta que você criou para o projeto, por exemplo C:\Users\UFSC\Documents\teste_modelsim.
  ```
  cd C:/Users/UFSC/Documents/teste_modelsim
  ```
* A ferramenta ModelSim precisa de um diretório chamado work, para que sejam armazenados os arquivos provenientes da compilação dos códigos. Crie o diretório work com o seguinte comando:
  ```
  vlib work
  ```
* Compile o arquivo de TestBench:
  ```
  vcom TB_PROCESSO_END.vhd
  ```
* Compile o arquivo com o componente a ser testado:
  ```
  vcom PROCESSO_END.vhd
  ```
* Na barra superior da ferramenta ModelSim vá na opção **Simulate** e depois em **Start Simulation**. Expandindo a biblioteca work deve aparecer os dois arquivos .vhd que estão na pasta de simulação, selecione o de TestBench.

* Antes de rodar a simulação, verifique a se a CheckBox While Enable Optimization está selecionada. Caso esteja, desmarque-a, caso contrário alguns dos sinais podem não aparecer para serem simulados.
  ![Tela Start Simulation](https://i.stack.imgur.com/VIWhS.jpg)
  
* Irá aparecer uma tela com os sinais disponíveis para a simulação, selecione-os, clique com o botão direito e selecione a opção **Add Wave**
* Abrirá a tela onde será observado o resultado da simulação.
* A partir de então, basta seguir com a simulação. Ajuste o tempo de simulação e outros parâmetros que lhe forem pertinentes e então inicie a simulação. Você pode iniciar a simulação através da barra de opções ou pelo comando: 
  ```
  run
  ```
