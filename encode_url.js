function encode_url(r) {
    let path = r.uri;
    if (typeof r.variables.args !== 'undefined') {
        path = path.concat("?", r.variables.args);
    }
    return encodeURIComponent(path);
}

export default {encode_url};