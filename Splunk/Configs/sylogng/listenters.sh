source s_palo_alto {
    network(
        ip(0.0.0.0)
        transport("tcp")
        port(5818)
    );
};

source s_epic_systems {
    network(
        ip(0.0.0.0)
        transport("tcp")
        port(5819)
    );
};

destination d_palo_alto {
    file("/var/syslog/palo_alto/${HOST}/${YEAR}_${MONTH}_${DAY}.log");
};

destination d_epic_systems {
    file("/var/syslog/epic_systems/${HOST}/${YEAR}_${MONTH}_${DAY}.log");
};

log {
    source(s_palo_alto);
    destination(d_palo_alto);
};

log {
    source(s_epic_systems);
    destination(d_epic_systems);
};