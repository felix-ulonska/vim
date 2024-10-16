return {
    s("!doc", {
        t("/// <summary>"),
        t({"", "/// "}), i(1, "Description..."),
        t({"", "/// </summary>"}),
        t({"", "/// <param name=\""}), i(2, "paramName"), t("\">"), i(3, "Parameter description..."), t("</param>"),
        t({"", "/// <returns>"}), i(4, "Return value description..."), t("</returns>"),
    }),
}
