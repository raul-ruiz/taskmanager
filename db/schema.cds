namespace sap.capire.taskmanager;

using { managed, cuid } from '@sap/cds/common';

type Status: String enum{
    PorRecibir; Recibido;EnCurso;Parado; Entregado;Cancelado;
}
entity Requestors: managed{
    key ID: Integer;
    name: String;
    tasks: Association to many Tasks on tasks.requestor = $self;
    requirements: Association to many Requirements on requirements.requestor = $self;
}

entity Developers: managed{
    key ID: Integer;
    name: String;
    tasks: Association to many Tasks on tasks.developer = $self;
}

entity Requirements: managed {
    KEY ID: Integer;
    reqID: String;
    title: String(100);
    release: String(5);
   
    comments: String(200);
    requestor: Association to Requestors;
    tasks: Association to many Tasks on tasks.requirement = $self;   
}
entity Tasks : managed {
    key ID: Integer;
    title : String;
    requestor: Association to Requestors;
    developer: Association to Developers;
    receptionDate: Date;
    deliveryDate: Date;
    status: Status;
    requirement: Association to Requirements;
    journalEntries: Association to many JournalEntries on journalEntries.task = $self;
    comments: String; 
}

entity Journals: managed{
    key ID: Integer;
    date: Date;
    developer: Association to Developers;
    comments: String;
    entries: Composition of many JournalEntries on entries.parent = $self;
}

entity JournalEntries: managed{
    key ID: Integer;
    parent: Association to Journals;
    task: Association to  Tasks;
    hours: Decimal(1,1);
    comments: String;
}