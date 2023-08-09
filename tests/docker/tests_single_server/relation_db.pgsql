INSERT INTO public.town (id, name)
VALUES
    (1, 'Stockholm'),
    (2, 'Skinnskatteberg');

INSERT INTO public.company (id, name, "townId")
VALUES
    (1, 'Serverpod', 1),
    (2, 'Systemair', 2);

INSERT INTO public.citizen (id, name, "companyId", "oldCompanyId")
VALUES
    (1, 'Alex', 1, 2),
    (2, 'Isak', 1, NULL);
