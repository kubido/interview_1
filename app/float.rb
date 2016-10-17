class Float
  def round_to(x)
    if self.round(x).to_s[-1].to_i < 5
      (self*(10*x)).ceil/(10*x).to_f
    else
      self.round(x)
    end
  end

end