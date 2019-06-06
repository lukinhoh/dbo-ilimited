            <div class="col-sm">
                <table class="table table-hover table-dark">
                    <thead>
                        <th class="text-center" scope="col">Servidor</th>
                    </thead>
                    <thead>
                        <?php $consultar_onlines = pegar_chars_on(); if($consultar_onlines['all_online'] >= 1){?>
                        <tr>
                            <td>Servidor Status: <a class="text-success">Online</a></td>
                        </tr> 
                        <tr>
                            <td>Jogadores Online: <a class="text-success"><?php echo $consultar_onlines['all_online']; ?></a></td>
                        </tr>   
                        <?php } else {?>
                        <tr>
                            <td>Servidor Status: <a class="text-danger">Offline</a></td>
                        </tr>
                        <tr>
                            <td>Jogadores Online: <a class="text-danger"><?php echo $consultar_onlines['all_online']; ?></a></td>
                        </tr>
                        <?php } ?>
                    </thead>
                </table>
            </div>
        </div>
    </main>
</div>