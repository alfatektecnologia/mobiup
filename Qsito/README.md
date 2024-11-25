# CarnavalScores Smart Contract

## Overview
The **CarnavalScores** smart contract is a Solidity-based Ethereum contract designed to manage the scoring of samba schools in the Carnival of Rio de Janeiro. The contract includes functionalities for adding judges, schools, and scoring criteria, as well as recording and retrieving scores. It also ensures that only authorized personnel can add or clear data, maintaining the integrity and security of the scoring process.

## Smart Contract Details

### Features
1. **Adding Judges (Jurados)**: Allows the contract owner to add new judges who can later submit scores.
2. **Adding Schools (Escolas)**: Enables the contract owner to add new samba schools that will be judged.
3. **Adding Criteria (Quesitos)**: Permits the contract owner to add new scoring criteria.
4. **Recording Scores (Notas)**: Judges can record scores for specific schools based on different criteria.
5. **Retrieving Scores**: Anyone can retrieve the scores for a particular school and criteria.
6. **Clearing Data**: The contract owner can clear all stored data, if needed.

### Contract Structure
- **Jurado**: Struct containing judge's address and name.
- **Escola**: Struct containing school's ID and name.
- **Quesito**: Struct containing criteria's ID and name.
- **Nota**: Struct containing school ID, criteria ID, judge's address, and score.

### Mappings and Arrays
- **quantidadeJurados**: Array storing judge details.
- **escolas**: Array storing school details.
- **quesitos**: Array storing criteria details.
- **notas**: Array storing all recorded scores.
- **jurados**: Mapping of judge addresses to judge details.
- **notasPorEscolaQuesito**: Mapping of school ID and criteria ID to scores.

### Modifiers
- **onlyOwner**: Ensures that only the contract owner can execute certain functions, providing access control.

### Events
- **JuradoAdicionado**: Emitted when a new judge is added.
- **EscolaAdicionada**: Emitted when a new school is added.
- **QuesitoAdicionado**: Emitted when a new criteria is added.

## Functions

### addJurado
```solidity
function addJurado(string memory _nomeJurado) public onlyOwner returns (uint)
```
Allows the contract owner to add a new judge.

### addEscola
```solidity
function addEscola(string memory _nomeEscola) public onlyOwner returns (uint)
```
Allows the contract owner to add a new team.

### addQuesito
```solidity
function addQuesito(string memory _nomeQuesito) public onlyOwner returns (uint)
```
Allows the contract owner to add a new criteria.

### registrarNota
```solidity
function registrarNota(uint _escolaId, uint _quesitoId, uint _nota) public
```
Allows judges to record scores for a specific team and criteria.

### getNota
```solidity
function getNota(uint _escolaId, uint _quesitoId) public view returns (uint)
```
Allows anyone to retrieve the score for a specific team and criteria.

### limparDados
```solidity
function limparDados() public onlyOwner
```
Allows the contract owner to clear all stored data.

### Security Considerations
Access Control: The onlyOwner modifier ensures that only the contract owner can add or clear data.

Validations: The contract includes validations for the range of scores and ensures that only authorized judges can record scores.

### Usage
Deploy the Contract: Deploy the CarnavalScores contract to the Ethereum network.

Add Data: Use the addJurado, addEscola, and addQuesito functions to add judges, schools, and criteria.

Record Scores: Judges can use the registrarNota function to record scores.

Retrieve Scores: Anyone can use the getNota function to retrieve scores.

Clear Data: The contract owner can use the limparDados function to clear all stored data when needed.

### Contact
For questions or further information, please contact me: emanoel_oliveira@outlook.com
    







