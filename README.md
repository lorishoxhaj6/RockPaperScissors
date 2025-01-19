# Laboratorio di Architettura degli Elaboratori
![Logo Università di Verona](https://www.univr.it/layouts/univr-bootstrap/assets/images/logo-univr.svg)  
**Progetto Universitario - Università degli Studi di Verona**  
_Corso di Architettura degli Elaboratori_  
_Autori: [Loris Hoxhaj, Mattia Nicolis]_  

---

## 🖋 Descrizione del Progetto
Questo progetto, intitolato **"Elaborato SIS e Verilog per la gestione della morra cinese"**, è stato sviluppato come parte del corso **"Architettura degli Elaboratori"** durante l'anno accademico **2023/2024**.  
Il progetto consiste nella realizzazione di un dispositivo per gestire le partite del gioco della morra cinese, rispettando regole specifiche e implementando il circuito sia in Verilog che in SIS.

### Obiettivi:
- **Implementare le regole del gioco**: Sasso, carta e forbici con le relative condizioni di vittoria e pareggio.
- **Gestire il numero massimo di manche**: Da 4 a 19 partite in base agli ingressi iniziali.
- **Garantire vincoli aggiuntivi**: Come il divieto per il vincitore della manche precedente di ripetere l'ultima mossa.
- **Progettare il circuito FSMD**: Sia in Verilog che in SIS con test automatizzati.

---

## 🗁 Struttura del Progetto
La struttura dei file del progetto è organizzata come segue:
```
VRXXXXXX_VRXXXXXX/
├── verilog/
│   ├── design.sv          # Modello principale in Verilog
│   ├── testbench.sv       # Testbench Verilog
│   ├── output_verilog.txt # Output generato dal modello Verilog
├── sis/
│   ├── non_ottimizzato/   # Sorgenti non ottimizzati
│   │   ├── ...
│   ├── FSMD.blif          # Modello ottimizzato in SIS
│   ├── testbench.script   # Script testbench generato
│   ├── output_sis.txt     # Output filtrato del modello SIS
├── Relazione.pdf           # Relazione dettagliata
```

---

## 🚀 Come Avviare il Progetto
### Requisiti
- **Simulatore Verilog**: Ad esempio, ModelSim o Icarus Verilog
- **Strumenti SIS**: Disponibili nell'ambiente di sviluppo del corso

### Istruzioni per l'Esecuzione del Modello Verilog
1. Compilare il modello Verilog:
   ```bash
   iverilog -o design.out design.sv testbench.sv
   ```
2. Eseguire la simulazione:
   ```bash
   vvp design.out
   ```
3. Verificare l'output generato:
   Controllare il file `output_verilog.txt` per i risultati della simulazione.

### Istruzioni per l'Esecuzione del Modello SIS
1. Caricare il modello BLIF ottimizzato:
   ```bash
   sis -t none -f testbench.script
   ```
2. Verificare l'output filtrato:
   Controllare il file `output_sis.txt` e confrontarlo con `output_verilog.txt`.

---

## 🔰 Dettagli Tecnici
- **Ingressi del circuito**:
  - `PRIMO` [2 bit]: Mossa del primo giocatore
  - `SECONDO` [2 bit]: Mossa del secondo giocatore
  - `INIZIA` [1 bit]: Reset e configurazione iniziale
- **Uscite del circuito**:
  - `MANCHE` [2 bit]: Esito della manche
  - `PARTITA` [2 bit]: Esito della partita
- **File generati**:
  - `output_verilog.txt` per il modello Verilog
  - `output_sis.txt` per il modello SIS

---

## 🛠️ Funzionalità Implementate
- **Gestione completa delle regole del gioco**:
  - Rispetto delle regole di vittoria e pareggio.
  - Validazione delle mosse secondo i vincoli specificati.
- **Supporto multi-manche**: Fino a 19 partite configurabili.
- **Sincronizzazione Verilog-SIS**: Gli output dei due modelli sono equivalenti.
- **Test automatizzati**: Script di test per validare entrambe le implementazioni.

---

## 🥽‍♂️ Testing
Eseguire i test automatici per verificare:
- **Correttezza delle regole**: Validazione delle mosse e degli esiti.
- **Confronto Verilog-SIS**: Equivalenza comportamentale dei modelli.

---

## 📜 Licenza
Questo progetto è ad uso esclusivamente accademico e non è distribuito pubblicamente.

---

## 🧡 Contatti
Per domande o chiarimenti, contattare:
- Loris Hoxhaj: [loris.hoxhaj@studenti.univr.it]
  

