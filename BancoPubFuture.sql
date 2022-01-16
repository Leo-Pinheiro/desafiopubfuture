drop table receitas;
drop table contas;
create table receitas(
idConta serial not null,
valor varchar(30) not null,
dataRecebimento date not null,
dataRecebimentoEsperado date not null,
descricao varchar(30) not null,
tipoReceita varchar(30) not null,
primary key(idConta));

create table despesas(
idConta serial not null,
dataPagamento date not null,
dataPagamentoEsperado date not null,
tipoDespesa varchar(30) not null,
primary key (idConta));

create table contas(
idConta serial not null,
numeroConta integer not null,
saldo varchar(30) not null,
tipoConta varchar(30) not null,
instituicaoFinanceira varchar(30) not null,
primary key(idConta));
