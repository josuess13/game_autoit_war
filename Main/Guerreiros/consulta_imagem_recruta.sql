SELECT 
    CASE 
        WHEN r.sexo = 'M' THEN im_masc.caminho_imagem
        WHEN r.sexo = 'F' THEN im_fem.caminho_imagem
    END AS caminho_imagem
FROM 
    recrutas r
LEFT JOIN 
    imagem_recruta_masculinos im_masc ON r.imagem_recruta_masculinos_id = im_masc.id AND r.sexo = 'M'
LEFT JOIN 
    imagem_recruta_femininos im_fem ON r.imagem_recruta_femininos_id = im_fem.id AND r.sexo = 'F'
WHERE 
    r.nome = 