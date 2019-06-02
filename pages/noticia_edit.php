<?php
    switch (get_post_action('btn_editar_noticia', 'btn_deletar_noticia')) {
        case 'btn_editar_noticia':
            //edit article and keep editing
            break;

        case 'btn_deletar_noticia':
            //delete article and redirect
            return delet_notice($_POST['id_deletar_noticia']) && alert('Postagem deletada!', 'inicio');
            break;

        default:
            //no action sent
    }
?>
