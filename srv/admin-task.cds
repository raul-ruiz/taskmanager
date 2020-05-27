using { sap.capire.taskmanager as my} from '../db/schema';
service AdminTaskService {
    @readonly entity Requirements as projection on my.Requirements;
    @odata.draft.enabled

    entity Tasks as projection on my.Tasks;
    @readonly entity Developers as projection on my.Developers;
    @readonly entity Requestors as projection on my.Requestors;
}
