
create table contas(
idconta serial not null,
numeroconta int not null,
saldo int not null, 
tipoconta varchar(30) not null,
instituicaofinanceira varchar(30) not null,
primary key(idconta));

create table despesas(
iddespesa serial not null,
valor int not null,
datapagamento date not null,
datapagamentoesperado date not null,
tipodespesa varchar not null,
numeroconta int not null,
primary key(iddespesa));

create table receitas(
idreceita serial not null,
valor int not null,
datarecebimento date not null,
datarecebimentoesperado date not null,
tiporeceita varchar(30) not null,
descricao varchar(30) not null,
numeroconta int not null,
primary key(idreceita));

