using { sap.atc.taskmanager as my} from '../db/schema';
service AdminReqService {
    @odata.draft.enabled 
    @cds.autoexpose 
    entity Requirements as projection on my.Requirements;
    entity Requestors @readonly as projection on my.Requestors;
    entity Tasks @readonly as projection on my.Tasks;
}

