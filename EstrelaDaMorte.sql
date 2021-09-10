create database EstrelaDaMorte;
use EstrelaDaMorte;

create table Planetas(
	idPlaneta int not null,
	nome varchar(50) not null,
	rotacao float not null,
	orbita float not null,
	diametro float not null,
	clima varchar(50) not null,
	populacao int not null
);
alter table Planetas add constraint PK_Planetas primary key (idPlaneta);

create table Naves(
	idNave int not null primary key,
	nome varchar(100) not null,
	modelo varchar(150) not null,
	passageiros int not null,
	carga float not null,
	classe varchar(100) not null
);

create table Pilotos(
	idPiloto int not null,
	nome varchar(200) not null,
	anoNasc varchar(10) not null,
	idPlaneta int not null
);
alter table Pilotos add constraint PK_Pilotos primary key (idPiloto);
alter table Pilotos add constraint FK_Pilotos_Planetas foreign key(idPlaneta)
references Planetas (idPlaneta);

create table PilotosNaves(
	idPiloto int not null,
	idNave int not null,
	flagAutorizado bit not null
);
alter table PilotosNaves add constraint PK_PilotosNaves primary key(idPiloto, idNave);
alter table PilotosNaves add constraint FK_PilotosNaves_Pilotos foreign key(idPiloto)
references Pilotos(idPiloto);
alter table PilotosNaves add constraint FK_PilotosNaves_Naves foreign key(idNave)
references Naves(idNave);
alter table PilotosNaves add constraint DF_PilotosNaves_FlagAutorizado default(1)
for flagAutorizado;

create table HistoricoViagens(
	idNave int not null, 
	idPiloto int not null,
	dtSaida datetime not null,
	dtChegada datetime null
);
alter table HistoricoViagens add constraint FK_HistoricoViagens_PilotosNaves foreign key
(idPiloto, idNave) references PilotosNaves(idPiloto, idNave);
alter table HistoricoViagens check constraint FK_HistoricoViagens_PilotosNaves;