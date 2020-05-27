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
            {Type: 'UI.DataField', Value: title, Label: '{i18n>Description}'},  {Type: 'UI.DataField', Value: status, Label: '{i18n>Status}'}            
        ] 
    }

);