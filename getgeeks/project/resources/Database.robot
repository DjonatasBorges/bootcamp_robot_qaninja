*Settings*

Documentation       Database Helpers

Library         DatabaseLibrary


*Keywords*
Connect To Prostgres

    Connect To Database     psycopg2
    ...                     pmmfljbx
    ...                     pmmfljbx
    ...                     OTDswvWNrLAucNZRmEBXJRtndjdnbJlF
    ...                     chunee.db.elephantsql.com
    ...                     5432


Reset Env
    Execute SQL String      DELETE from public.geeks;                
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]     ${user}

    ${name}         Set Variable        ${user}[name] ${user}[lastname]
    ${email}        Set Variable        ${user}[email]
    ${password}     Set Variable        ${user}[password]

    ${query}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${name}', '${email}', '${password}', false)

    Execute SQL String  ${query}