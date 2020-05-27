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
            Description: { Value: title }
        },
        SelectionFields: [reqID, title],
        LineItem: [
            {Type: 'UI.DataField', Value: reqID, Label: '{i18n>Req}' },
            {Type: 'UI.DataField', Value: title, Label: '{i18n>Description}'}            
        ] 
    }

);
