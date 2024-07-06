SELECT 
    CASE 
        WHEN r.sexo = 'M' THEN im_masc.caminho_imagem
        WHEN r.sexo = 'F' THEN im_fem.caminho_imagem
    END AS caminho_imagem
FROM 
    guerreiros r
LEFT JOIN 
    imagem_guerreiros_masculinos im_masc ON r.imagem_guerreiros_masculinos_id = im_masc.id AND r.sexo = 'M'
LEFT JOIN 
    imagem_guerreiros_femininos im_fem ON r.imagem_guerreiros_femininos_id = im_fem.id AND r.sexo = 'F'
WHERE 
    r.nome = 