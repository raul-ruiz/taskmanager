using {sap.atc.taskmanager as my} from '../../db/schema';

// Requirement list
annotate AdminReqService.Requirements with @(UI : {
    HeaderInfo              : {
        TypeName       : '{i18n>Req}',
        TypeNamePlural : '{i18n>ReqPlural}',
        Title          : {Value : title}
    },
    SelectionFields         : [
    reqID,
    title
    ],
    LineItem                : [
    {
        Type  : 'UI.DataField',
        Value : reqID,
        Label : '{i18n>Req}'
    },
    {
        Type  : 'UI.DataField',
        Value : title,
        Label : '{i18n>Description}'
    },
    {
        Type  : 'UI.DataField',
        Value : requestor.name,
        Label : '{i18n>Requestor}'
    }
    ],

    // Object page
    Facets                  : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#ReqDetails',
        Label  : '{i18n>Req.Details}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#ReqComments',
        Label  : '{i18n>Req.Comments}'
    }
    ],
    FieldGroup #ReqDetails  : {Data : [
    {
        $Type : 'UI.DataField',
        Value : reqID
    },
    {
        $Type : 'UI.DataField',
        Value : release
    },
    {
        $Type : 'UI.DataField',
        Value : requestor_ID
    }
    ]},
    FieldGroup #ReqComments : {Data : [{
        $Type : 'UI.DataField',
        Value : comments
    }]}
}) {
    //  Define search for requestor
    requestor @ValueList.entity : 'Requestors'

};


// Requirement behaviour and  format
annotate my.Requirements with {
    requestor @(
        Common           : {
            Text         : {
                $value                 : requestor.name,
                ![@UI.TextArrangement] : #TextOnly
            },
            FieldControl : #Mandatory
        },
        ValueList.entity : 'Requestors'
    )


};

annotate my.Requirements with {
    ID        @title  : '{i18n>ID}'  @UI.HiddenFilter;
    reqID     @title  : '{i18n>Req}';
    title     @title  : '{i18n>Description}';
    release   @title  : '{i18n>Rel}';
    @UI.multiLineText : true
    comments  @title  : '{i18n>Comments}';
    requestor @title  : '{i18n>Requestor}';


};


// Requestor behaviour and format
// On search, show column name to help user to select and hide guid
annotate my.Requestors with @(UI : {Identification : [{Value : name}]}) {
    ID @UI.Hidden;
};

// On field, hide the guid and show just the name
annotate my.Requestors with {

    ID   @title : '{i18n>ID}'  @UI.HiddenFilter;
    name @title : '{i18n>Requestor}';

}
