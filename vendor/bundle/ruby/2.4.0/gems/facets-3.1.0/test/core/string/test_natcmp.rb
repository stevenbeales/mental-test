covers 'facets/string/natcmp'

test_case String do

  method :natcmp do

    test do
      "my_prog_v1.1.0".natcmp( "my_prog_v1.2.0").assert == -1
      "my_prog_v1.2.0".natcmp("my_prog_v1.10.0").assert == -1
      "my_prog_v1.2.0".natcmp( "my_prog_v1.1.0").assert == 1
      "my_prog_v1.10.0".natcmp("my_prog_v1.2.0").assert == 1
      "my_prog_v1.0.0".natcmp( "my_prog_v1.0.0").assert == 0
    end

  end

end
