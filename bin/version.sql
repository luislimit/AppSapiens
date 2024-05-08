SELECT 
    version 
FROM 
    mantis_project_version_table 
where 
    released = 1 
    and obsolete = 0
order by date_order limit 1; 
