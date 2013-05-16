Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "dHnCQ1mDbLpfKECyGaSlJg", "NVHi0yeelMl4A8V6dmNArgLbLL5HwtaOfpVTy8KcYoI"
  provider :facebook, "504192672980283", "9c159f426c8ea7177137df79273e056c"
  provider :github, "b9c3a9b58d43335a2b66", "17705f34aa0fa83109aff5daf4707fb20c632157"
end
