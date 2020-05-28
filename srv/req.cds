using { sap.capire.taskmanager as my} from '../db/schema';
service AdminReqService {
    @odata.draft.enabled
     
    entity Requirements as projection on my.Requirements;
     entity Requestors as projection on my.Requestors;
}

