/*
   Annotations 
*/

using { sap.capire.taskmanager as my } from '../../db/schema';

/// Task  list
annotate AdminTaskService.Tasks with @(
    UI:{
        HeaderInfo: {
            TypeName: '{i18n>Task}',
            TypeNamePlural: '{i18n>TaskPlural}',
            Description: { Value: title }
        },
        SelectionFields: [status, title],
        LineItem: [
            {Type: 'UI.DataField', Value: title, Label: '{i18n>Description}'},  
            {Type: 'UI.DataField', Value: status, Label: '{i18n>Status}'} ,
            {Type: 'UI.DataField', Value: developer.name, Label:'{i18n>Developer}'}           
        ] ,
        Facets:[
            {$Type: 'UI.ReferenceFacet', Target:'@UI.FieldGroup#TaskDetails', Label:'{i18n>TaskDetails}'}
        ],
        FieldGroup#TaskDetails:{
        Data:[
           {$Type: 'UI.DataField', Value: requirement_ID},
           {$Type: 'UI.DataField', Value: ticket},
           {$Type: 'UI.DataField', Value: receptionDate},
           {$Type: 'UI.DataField', Value: deliveryDate},
           {$Type: 'UI.DataField', Value: requestor_ID},
           {$Type: 'UI.DataField', Value: developer_ID},
           {$Type: 'UI.DataField', Value: status}
        ]
        }
    
    }

)
{

    requestor @ValueList.entity: 'Requestors';
    developer @ValueList.entity: 'Developers' ;
    requirement @ValueList.entity: 'Requirements';
};

 
annotate my.Developers with @(
    UI:{
        Identification:[{Value:name}]
    }
){
    ID @UI.Hidden;
} ;
 
annotate my.Requirements with @(
    UI:{
        Identification:[{Value:reqID}]
    }
){
    ID @UI.Hidden;
} ;

annotate  my.Developers with {
    
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    name @title:'{i18n>Developer}';
}

 

annotate my.Tasks with{
    ticket @title:'{i18n>TaskTicket}';
    receptionDate @title:'{i18n>TaskRecepDate}';
    deliveryDate @title:'{i18n>TaskDelivDate}';
    status  @title:'{i18n>TaskStatus}';
    comments @title:'{i18n>TaskComments}';
    requirement @title:'{i18n>Req}';
    developer @title:'{i18n>Developer}';
    requestor @title:'{i18n>Requestor}';
}

annotate my.Tasks with {
    requestor @(
        Common: {
            Text: {$value: requestor.name, ![@UI.TextArrangement]: #TextOnly},
            FieldControl: #Mandatory
        },
        ValueList.entity:'Requestors'
    );
    developer @(
        Common: {
            Text: {$value: developer.name, ![@UI.TextArrangement]: #TextOnly},
            FieldControl: #Mandatory
        },
        ValueList.entity:'Developers'
    );
    requirement @(
        Common: {
            Text: {$value: requirement.reqID, ![@UI.TextArrangement]: #TextOnly},
            FieldControl: #Mandatory
        },
        ValueList.entity:'Requirements'
    );

} ;

