class Dollar < Formatter

  def format
    set_columns('$')
    set_hash('$')
  end

end