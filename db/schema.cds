namespace sap.atc.taskmanager;

using {
    managed,
    cuid,
    sap.common
} from '@sap/cds/common';

 
entity Requestors : managed, cuid {

    name         : String;
    tasks        : Association to many Tasks
                       on tasks.requestor = $self;
    requirements : Association to many Requirements
                       on requirements.requestor = $self;
}

entity Developers : managed, cuid {
    name  : String;
    tasks : Association to many Tasks
                on tasks.developer = $self;
}

entity Requirements : managed, cuid {
    reqID     : String;
    title     : String(100);
    release   : String(5);
    comments  : String(200);
    requestor : Association to Requestors;
    tasks     : Association to many Tasks
                    on tasks.requirement = $self;
}

entity Tasks : managed, cuid {
    ticket         : String;
    title          : String;
    requestor      : Association to Requestors;
    developer      : Association to Developers;
    receptionDate  : Date;
    deliveryDate   : Date;
    requirement    : Association to Requirements;
    status        : Association to Statuses;
    journalEntries : Association to many JournalEntries
                         on journalEntries.task = $self;
    comments       : String;
}

entity Journals : managed {
    key ID        : Integer;
        date      : Date;
        developer : Association to Developers;
        comments  : String;
        entries   : Composition of many JournalEntries
                        on entries.parent = $self;
}

entity JournalEntries : managed {
    key ID       : Integer;
        parent   : Association to Journals;
        task     : Association to Tasks;
        hours    : Decimal(1, 1);
        comments : String;
}

 
 entity Statuses: common.CodeList{
     key ID: Integer;
     name: String;
     

 }