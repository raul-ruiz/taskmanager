using { sap.capire.taskmanager as my} from '../db/schema';
service AdminTaskService {
    @odata.draft.enabled
    entity Tasks as projection on my.Tasks;
    @readonly entity Requirements as projection on my.Requirements;
    @readonly entity Developers as projection on my.Developers;
    @readonly entity Requestors as projection on my.Requestors;
}
