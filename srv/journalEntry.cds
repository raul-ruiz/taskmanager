using { sap.atc.taskmanager as my} from '../db/schema';
service JournalEntryService {
    entity Journal as projection on my.Journals;
    entity JournalEntry as projection on my.JournalEntries;
    @readonly entity Tasks as projection on my.Tasks;    
    @readonly entity Developers as projection on my.Developers;
    
}
