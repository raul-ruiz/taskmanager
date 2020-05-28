/*
   Annotations  
*/

using { sap.capire.taskmanager as my } from '../../db/schema';

/// Requirement list
annotate AdminReqService.Requirements with @(
    UI:{
        HeaderInfo: {
            TypeName: '{i18n>Req}',
            TypeNamePlural: '{i18n>ReqPlural}',
            Description: { Value: reqID }
        },
        SelectionFields: [reqID, title],
        LineItem: [
            {Type: 'UI.DataField', Value: reqID, Label: '{i18n>Req}' },
            {Type: 'UI.DataField', Value: title, Label: '{i18n>Description}'} ,   
            {Type: 'UI.DataField', Value: requestor.name, Label: '{i18n>Requestor}'}          
        ] ,
   
    Facets:[
        {$Type: 'UI.ReferenceFacet', Target:'@UI.FieldGroup#ReqDetails', Label:'{i18n>Req.Details}'},
        {$Type: 'UI.ReferenceFacet', Target:'@UI.FieldGroup#ReqComments', Label:'{i18n>Req.Comments}'}
    ],
    FieldGroup#ReqDetails:{
        Data:[
            {$Type: 'UI.DataField', Value: release},
            {$Type: 'UI.DataField', Value: requestor.name}
        ]
    },
    FieldGroup#ReqComments:{
        Data:[
            {$Type: 'UI.DataField', Value: comments}
        ]
    }
 }  
);


annotate  my.Requirements with{
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    reqID @title:'{i18n>Req}';
    title @title:'{i18n>Description}';
    release @title:'{i18n>Rel}';
    comments @title:'{i18n>Comments}';
    requestor @title: '{i18n>Requestor}';

} ;

