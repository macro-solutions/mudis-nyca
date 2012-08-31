<link rel="stylesheet" href="../css/login.css"> 
<header></header>
<section>
    <form action="" method="post">
        <label for="usr">Usuario: </label> 
        <input type="text" name="login[usr]" id="usr" /> 
        <label for="pwd">Contraseña: </label>
        <input type="password" name="login[pwd]" id="pwd" /> 
        <label for="pwd">País: </label>
        <select name="login[pais]" id="pais">
            <option value="0">Seleccionar..</option>
            <option value="1">México</option>
        </select>
        <input type="submit" name="entrar" value="Entrar" />
        <?php echo isset($error) ? $error : "" ?>
    </form>
</section>
<footer> </footer>