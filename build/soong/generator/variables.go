package generator

import (
	"fmt"

	"android/soong/android"
)

func portalromExpandVariables(ctx android.ModuleContext, in string) string {
	portalromVars := ctx.Config().VendorConfig("portalromVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if portalromVars.IsSet(name) {
			return portalromVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
